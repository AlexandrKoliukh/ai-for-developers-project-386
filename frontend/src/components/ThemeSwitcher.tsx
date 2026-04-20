import { useTheme } from '../context/ThemeContext';

export default function ThemeSwitcher() {
  const { theme, setTheme } = useTheme();

  const icons: Record<string, string> = {
    light: '☀',
    dark: '☾',
    system: '◎',
  };

  const labels: Record<string, string> = {
    light: 'Светлая',
    dark: 'Тёмная',
    system: 'Авто',
  };

  const cycle = () => {
    const next: Record<string, string> = { light: 'dark', dark: 'system', system: 'light' };
    setTheme(next[theme] as 'light' | 'dark' | 'system');
  };

  return (
    <button className="theme-switcher" onClick={cycle} title={`Тема: ${labels[theme]}`}>
      <span className="theme-icon">{icons[theme]}</span>
    </button>
  );
}