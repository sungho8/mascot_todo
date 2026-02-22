-- ============================================
-- Mascot Todo - Supabase Database Schema
-- ============================================
-- 이 파일을 Supabase SQL Editor에 복사 붙여넣기하세요
-- https://supabase.com/dashboard/project/YOUR_PROJECT/sql/new
-- ============================================

-- Enable UUID extension
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- ============================================
-- 1. Users Table (확장 프로필)
-- ============================================
-- Supabase auth.users와 1:1 매핑
CREATE TABLE IF NOT EXISTS public.users (
  id UUID PRIMARY KEY REFERENCES auth.users(id) ON DELETE CASCADE,
  kakao_id VARCHAR(255) UNIQUE,
  nickname VARCHAR(50),
  profile_image_url TEXT,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- ============================================
-- 2. Mascots Table (마스코트 마스터 데이터)
-- ============================================
CREATE TABLE IF NOT EXISTS public.mascots (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  name VARCHAR(50) NOT NULL,
  description TEXT,
  image_path VARCHAR(255) NOT NULL,
  unlock_condition_type VARCHAR(50) NOT NULL, -- 'default', 'streak', 'total_completed', etc.
  unlock_condition_value INT DEFAULT 0, -- 필요한 값 (예: 연속 3일 = 3)
  unlock_description TEXT, -- "연속 3일 달성" 등 설명
  is_default BOOLEAN DEFAULT FALSE, -- 기본 제공 마스코트
  max_level INT DEFAULT 10,
  exp_per_level INT DEFAULT 100, -- 레벨당 필요 경험치
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- ============================================
-- 3. User Mascots Table (사용자 보유 마스코트)
-- ============================================
CREATE TABLE IF NOT EXISTS public.user_mascots (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  user_id UUID NOT NULL REFERENCES public.users(id) ON DELETE CASCADE,
  mascot_id UUID NOT NULL REFERENCES public.mascots(id) ON DELETE CASCADE,
  current_level INT DEFAULT 1,
  current_exp DOUBLE PRECISION DEFAULT 0,
  is_main BOOLEAN DEFAULT FALSE, -- 주력 마스코트 여부
  unlocked_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  UNIQUE(user_id, mascot_id)
);

-- ============================================
-- 4. Todos Table (할 일)
-- ============================================
CREATE TABLE IF NOT EXISTS public.todos (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  user_id UUID NOT NULL REFERENCES public.users(id) ON DELETE CASCADE,
  title VARCHAR(255) NOT NULL,
  description TEXT,
  is_completed BOOLEAN DEFAULT FALSE,
  is_focus BOOLEAN DEFAULT FALSE, -- 오늘의 집중 과제 여부
  is_recurring BOOLEAN DEFAULT FALSE, -- 매일 반복 여부
  recurring_source_id UUID REFERENCES public.todos(id) ON DELETE SET NULL, -- 반복 템플릿 원본 ID
  linked_mascot_id UUID REFERENCES public.user_mascots(id) ON DELETE SET NULL,
  target_date DATE NOT NULL,
  completed_at TIMESTAMP WITH TIME ZONE,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- ============================================
-- 5. User Stats Table (사용자 통계)
-- ============================================
CREATE TABLE IF NOT EXISTS public.user_stats (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  user_id UUID NOT NULL UNIQUE REFERENCES public.users(id) ON DELETE CASCADE,
  total_completed INT DEFAULT 0,
  current_streak INT DEFAULT 0, -- 현재 연속 달성 일수
  max_streak INT DEFAULT 0, -- 최대 연속 달성 일수
  early_bird_count INT DEFAULT 0, -- 새벽 완료 횟수 (4-7시)
  daily_max_completed INT DEFAULT 0, -- 하루 최대 완료 개수 기록
  last_completed_date DATE,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- ============================================
-- 6. Achievements Table (업적 마스터 데이터)
-- ============================================
CREATE TABLE IF NOT EXISTS public.achievements (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  name VARCHAR(100) NOT NULL,
  description TEXT,
  icon_path VARCHAR(255),
  condition_type VARCHAR(50) NOT NULL, -- 'streak', 'total_completed', 'early_bird', etc.
  condition_value INT NOT NULL,
  reward_mascot_id UUID REFERENCES public.mascots(id) ON DELETE SET NULL,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- ============================================
-- 7. User Achievements Table (사용자 달성 업적)
-- ============================================
CREATE TABLE IF NOT EXISTS public.user_achievements (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  user_id UUID NOT NULL REFERENCES public.users(id) ON DELETE CASCADE,
  achievement_id UUID NOT NULL REFERENCES public.achievements(id) ON DELETE CASCADE,
  achieved_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  UNIQUE(user_id, achievement_id)
);

-- ============================================
-- Indexes for Performance
-- ============================================
CREATE INDEX IF NOT EXISTS idx_todos_user_id ON public.todos(user_id);
CREATE INDEX IF NOT EXISTS idx_todos_target_date ON public.todos(target_date);
CREATE INDEX IF NOT EXISTS idx_todos_is_completed ON public.todos(is_completed);
CREATE INDEX IF NOT EXISTS idx_user_mascots_user_id ON public.user_mascots(user_id);
CREATE INDEX IF NOT EXISTS idx_user_mascots_is_main ON public.user_mascots(is_main);

-- ============================================
-- Row Level Security (RLS) Policies
-- ============================================

-- Enable RLS on all tables
ALTER TABLE public.users ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.user_mascots ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.todos ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.user_stats ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.user_achievements ENABLE ROW LEVEL SECURITY;

-- Users: 자신의 데이터만 조회/수정 가능
CREATE POLICY "Users can view own profile" ON public.users
  FOR SELECT USING (auth.uid() = id);

CREATE POLICY "Users can update own profile" ON public.users
  FOR UPDATE USING (auth.uid() = id);

CREATE POLICY "Users can insert own profile" ON public.users
  FOR INSERT WITH CHECK (auth.uid() = id);

-- User Mascots: 자신의 마스코트만 조회/수정 가능
CREATE POLICY "Users can view own mascots" ON public.user_mascots
  FOR SELECT USING (auth.uid() = user_id);

CREATE POLICY "Users can insert own mascots" ON public.user_mascots
  FOR INSERT WITH CHECK (auth.uid() = user_id);

CREATE POLICY "Users can update own mascots" ON public.user_mascots
  FOR UPDATE USING (auth.uid() = user_id);

-- Todos: 자신의 할 일만 조회/수정/삭제 가능
CREATE POLICY "Users can view own todos" ON public.todos
  FOR SELECT USING (auth.uid() = user_id);

CREATE POLICY "Users can insert own todos" ON public.todos
  FOR INSERT WITH CHECK (auth.uid() = user_id);

CREATE POLICY "Users can update own todos" ON public.todos
  FOR UPDATE USING (auth.uid() = user_id);

CREATE POLICY "Users can delete own todos" ON public.todos
  FOR DELETE USING (auth.uid() = user_id);

-- User Stats: 자신의 통계만 조회/수정 가능
CREATE POLICY "Users can view own stats" ON public.user_stats
  FOR SELECT USING (auth.uid() = user_id);

CREATE POLICY "Users can insert own stats" ON public.user_stats
  FOR INSERT WITH CHECK (auth.uid() = user_id);

CREATE POLICY "Users can update own stats" ON public.user_stats
  FOR UPDATE USING (auth.uid() = user_id);

-- User Achievements: 자신의 업적만 조회/수정 가능
CREATE POLICY "Users can view own achievements" ON public.user_achievements
  FOR SELECT USING (auth.uid() = user_id);

CREATE POLICY "Users can insert own achievements" ON public.user_achievements
  FOR INSERT WITH CHECK (auth.uid() = user_id);

-- Mascots & Achievements: 모두 조회 가능 (마스터 데이터)
CREATE POLICY "Anyone can view mascots" ON public.mascots
  FOR SELECT USING (true);

CREATE POLICY "Anyone can view achievements" ON public.achievements
  FOR SELECT USING (true);

-- ============================================
-- Trigger Functions
-- ============================================

-- updated_at 자동 업데이트 트리거 함수
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
  NEW.updated_at = NOW();
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- users 테이블 updated_at 트리거
CREATE TRIGGER update_users_updated_at
  BEFORE UPDATE ON public.users
  FOR EACH ROW
  EXECUTE FUNCTION update_updated_at_column();

-- todos 테이블 updated_at 트리거
CREATE TRIGGER update_todos_updated_at
  BEFORE UPDATE ON public.todos
  FOR EACH ROW
  EXECUTE FUNCTION update_updated_at_column();

-- user_stats 테이블 updated_at 트리거
CREATE TRIGGER update_user_stats_updated_at
  BEFORE UPDATE ON public.user_stats
  FOR EACH ROW
  EXECUTE FUNCTION update_updated_at_column();

-- ============================================
-- Business Logic Functions & Triggers
-- ============================================

-- 1. 통계 갱신 함수 (Todo 완료 시 호출)
CREATE OR REPLACE FUNCTION update_user_stats_on_todo_completion()
RETURNS TRIGGER AS $$
DECLARE
    today_date DATE := CURRENT_DATE;
    yesterday_date DATE := CURRENT_DATE - INTERVAL '1 day';
    daily_count INT;
    completion_hour INT;
BEGIN
    -- 완료 상태로 변경될 때만 처리
    IF (TG_OP = 'UPDATE' AND NEW.is_completed = TRUE AND OLD.is_completed = FALSE) OR (TG_OP = 'INSERT' AND NEW.is_completed = TRUE) THEN
        
        -- 기본 통계 업데이트
        UPDATE public.user_stats
        SET 
            total_completed = total_completed + 1,
            -- 연속 달성 로직
            current_streak = CASE 
                WHEN last_completed_date = yesterday_date THEN current_streak + 1
                WHEN last_completed_date = today_date THEN current_streak
                ELSE 1
            END,
            max_streak = GREATEST(max_streak, CASE 
                WHEN last_completed_date = yesterday_date THEN current_streak + 1
                WHEN last_completed_date = today_date THEN current_streak
                ELSE 1
            END),
            last_completed_date = today_date,
            updated_at = NOW()
        WHERE user_id = NEW.user_id;

        -- 새벽형 통계 (4시 ~ 7시) - KST 기준
        completion_hour := EXTRACT(HOUR FROM (NEW.completed_at AT TIME ZONE 'Asia/Seoul'));
        IF completion_hour >= 4 AND completion_hour < 7 THEN
            UPDATE public.user_stats
            SET early_bird_count = early_bird_count + 1
            WHERE user_id = NEW.user_id;
        END IF;

        -- 하루 최대 완료 개수 갱신
        SELECT COUNT(*) INTO daily_count
        FROM public.todos
        WHERE user_id = NEW.user_id 
          AND target_date = today_date 
          AND is_completed = TRUE;

        UPDATE public.user_stats
        SET daily_max_completed = GREATEST(daily_max_completed, daily_count)
        WHERE user_id = NEW.user_id;

    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- 2. 마스코트 해금 확인 함수
CREATE OR REPLACE FUNCTION check_and_unlock_mascots()
RETURNS TRIGGER AS $$
BEGIN
    -- 통계가 변경된 후 실시간 체크
    
    -- 루미 (연속 3일)
    IF NEW.current_streak >= 3 THEN
        INSERT INTO public.user_mascots (user_id, mascot_id)
        SELECT NEW.user_id, id FROM public.mascots WHERE name = '루미'
        ON CONFLICT DO NOTHING;
    END IF;

    -- 피피 (총 10개)
    IF NEW.total_completed >= 10 THEN
        INSERT INTO public.user_mascots (user_id, mascot_id)
        SELECT NEW.user_id, id FROM public.mascots WHERE name = '피피'
        ON CONFLICT DO NOTHING;
    END IF;

    -- 모모 (새벽 5회)
    IF NEW.early_bird_count >= 5 THEN
        INSERT INTO public.user_mascots (user_id, mascot_id)
        SELECT NEW.user_id, id FROM public.mascots WHERE name = '모모'
        ON CONFLICT DO NOTHING;
    END IF;

    -- 두두 (하루 5개)
    IF NEW.daily_max_completed >= 5 THEN
        INSERT INTO public.user_mascots (user_id, mascot_id)
        SELECT NEW.user_id, id FROM public.mascots WHERE name = '두두'
        ON CONFLICT DO NOTHING;
    END IF;

    -- 나나 (연속 7일)
    IF NEW.current_streak >= 7 THEN
        INSERT INTO public.user_mascots (user_id, mascot_id)
        SELECT NEW.user_id, id FROM public.mascots WHERE name = '나나'
        ON CONFLICT DO NOTHING;
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- 3. 트리거 설정
DROP TRIGGER IF EXISTS trg_update_user_stats ON public.todos;
CREATE TRIGGER trg_update_user_stats
AFTER INSERT OR UPDATE ON public.todos
FOR EACH ROW
EXECUTE FUNCTION update_user_stats_on_todo_completion();

DROP TRIGGER IF EXISTS trg_check_mascot_unlock ON public.user_stats;
CREATE TRIGGER trg_check_mascot_unlock
AFTER UPDATE ON public.user_stats
FOR EACH ROW
EXECUTE FUNCTION check_and_unlock_mascots();

-- ============================================
-- Initial Data (Sample Mascots)
-- ============================================

-- 기본 마스코트 (최초 가입 시 제공)
INSERT INTO public.mascots (name, description, image_path, unlock_condition_type, unlock_condition_value, is_default, unlock_description)
VALUES
  ('코코', '당신의 첫 번째 메이트입니다! 성실한 당근 나라의 가이드예요.', '/mascots/coco.png', 'default', 0, true, '회원가입 시 자동 제공'),
  ('루미', '작은 성취를 소중히 여기는 섬세한 고양이 페르소나입니다.', '/mascots/lumi.png', 'streak', 3, false, '3일 연속 할 일 완료 시 해금'),
  ('피피', '활기차고 긍정적인 에너지로 할 일을 정리해주는 강아지예요.', '/mascots/pipi.png', 'total_completed', 10, false, '총 할 일 10개 완료 시 해금'),
  ('모모', '조용한 새벽을 깨우며 아침의 기적을 만드는 햄스터입니다.', '/mascots/momo.png', 'early_bird', 5, false, '새벽 5시에 할 일 5번 완료 시 해금'),
  ('두두', '우직하고 든든하게 오늘의 할 일을 책임지는 곰 친구예요.', '/mascots/dudu.png', 'daily_max_completed', 5, false, '하루에 할 일 5개 이상 완료 시 해금'),
  ('나나', '차분하고 지혜롭게 긴 여정을 함께하는 여우 현자예요.', '/mascots/nana.png', 'streak', 7, false, '7일 연속 할 일 완료 시 해금')
ON CONFLICT DO NOTHING;

-- 샘플 업적
INSERT INTO public.achievements (name, description, condition_type, condition_value, reward_mascot_id)
SELECT
  '첫 걸음', '첫 번째 TODO를 완료하세요', 'total_completed', 1, NULL
WHERE NOT EXISTS (SELECT 1 FROM public.achievements WHERE name = '첫 걸음');

INSERT INTO public.achievements (name, description, condition_type, condition_value, reward_mascot_id)
SELECT
  '열정가득', '총 10개 TODO를 완료하세요', 'total_completed', 10,
  (SELECT id FROM public.mascots WHERE name = '피피' LIMIT 1)
WHERE NOT EXISTS (SELECT 1 FROM public.achievements WHERE name = '열정가득');

INSERT INTO public.achievements (name, description, condition_type, condition_value, reward_mascot_id)
SELECT
  '꾸준함의 힘', '3일 연속 TODO를 완료하세요', 'streak', 3,
  (SELECT id FROM public.mascots WHERE name = '루미' LIMIT 1)
WHERE NOT EXISTS (SELECT 1 FROM public.achievements WHERE name = '꾸준함의 힘');

-- ============================================
-- Functions for Business Logic
-- ============================================

-- 신규 사용자 등록 시 자동으로 기본 데이터 생성
CREATE OR REPLACE FUNCTION handle_new_user()
RETURNS TRIGGER AS $$
DECLARE
  default_mascot_id UUID;
BEGIN
  -- users 테이블에 사용자 추가
  INSERT INTO public.users (id)
  VALUES (NEW.id);

  -- user_stats 초기화
  INSERT INTO public.user_stats (user_id)
  VALUES (NEW.id);

  -- 기본 마스코트 지급
  SELECT id INTO default_mascot_id
  FROM public.mascots
  WHERE is_default = true
  LIMIT 1;

  IF default_mascot_id IS NOT NULL THEN
    INSERT INTO public.user_mascots (user_id, mascot_id, is_main)
    VALUES (NEW.id, default_mascot_id, true);
  END IF;

  RETURN NEW;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- auth.users 테이블에 새 사용자 생성 시 트리거
DROP TRIGGER IF EXISTS on_auth_user_created ON auth.users;
CREATE TRIGGER on_auth_user_created
  AFTER INSERT ON auth.users
  FOR EACH ROW
  EXECUTE FUNCTION handle_new_user();

-- ============================================
-- ✅ 스키마 생성 완료!
-- ============================================
-- 다음 단계:
-- 1. Supabase Dashboard > SQL Editor에서 이 파일 전체를 복사 붙여넣기
-- 2. "Run" 버튼 클릭
-- 3. 성공 메시지 확인
-- ============================================
