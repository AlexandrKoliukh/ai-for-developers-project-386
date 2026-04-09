/** Date/time utilities for Playwright tests. All dates are UTC. */

/** Returns today's date in UTC as YYYY-MM-DD. */
export function todayISO(): string {
  return new Date().toISOString().slice(0, 10);
}

/**
 * Returns a date within the 14-day booking window.
 * @param offset Number of days from today (1–13). Default 1 = tomorrow.
 */
export function dateInWindow(offset = 1): string {
  const d = new Date();
  d.setUTCDate(d.getUTCDate() + offset);
  return d.toISOString().slice(0, 10);
}

/** Returns a date outside the 14-day booking window (today + 20 days). */
export function dateOutOfWindow(): string {
  const d = new Date();
  d.setUTCDate(d.getUTCDate() + 20);
  return d.toISOString().slice(0, 10);
}

/**
 * Returns the first working slot start time for a given date (09:00 UTC),
 * formatted as an ISO 8601 UTC string. Assumes OWNER_TIMEZONE=UTC and
 * WORK_START_HOUR=9 (Docker defaults).
 */
export function firstWorkingSlotUTC(date: string): string {
  return `${date}T09:00:00.000Z`;
}

/**
 * Returns a URL-safe slug valid for event types.
 * Uses Date.now() to ensure uniqueness across test runs.
 */
export function randomSlug(): string {
  return `test-${Date.now().toString(36)}`;
}
