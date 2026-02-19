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
-- Initial Data (Sample Mascots)
-- ============================================

-- 기본 마스코트 (최초 가입 시 제공)
INSERT INTO public.mascots (name, description, image_path, unlock_condition_type, is_default, unlock_description)
VALUES
  ('토리', '처음 만나는 친구', '/mascots/tori.png', 'default', true, '회원가입 시 자동 제공'),
  ('무무', '성실한 친구', '/mascots/mumu.png', 'total_completed', false, '총 10개 TODO 완료'),
  ('루루', '끈기있는 친구', '/mascots/lulu.png', 'streak', false, '연속 3일 달성'),
  ('코코', '새벽형 인간', '/mascots/coco.png', 'early_bird', false, '새벽 5시에 5번 TODO 완료')
ON CONFLICT DO NOTHING;

-- 샘플 업적
INSERT INTO public.achievements (name, description, condition_type, condition_value, reward_mascot_id)
SELECT
  '첫 걸음', '첫 번째 TODO를 완료하세요', 'total_completed', 1, NULL
WHERE NOT EXISTS (SELECT 1 FROM public.achievements WHERE name = '첫 걸음');

INSERT INTO public.achievements (name, description, condition_type, condition_value, reward_mascot_id)
SELECT
  '열정가득', '총 10개 TODO를 완료하세요', 'total_completed', 10,
  (SELECT id FROM public.mascots WHERE name = '무무' LIMIT 1)
WHERE NOT EXISTS (SELECT 1 FROM public.achievements WHERE name = '열정가득');

INSERT INTO public.achievements (name, description, condition_type, condition_value, reward_mascot_id)
SELECT
  '꾸준함의 힘', '3일 연속 TODO를 완료하세요', 'streak', 3,
  (SELECT id FROM public.mascots WHERE name = '루루' LIMIT 1)
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
