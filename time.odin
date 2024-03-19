package dysonant

import "core:time"

@(private)
last_frame_time: time.Time
frame_time: f32

time_update :: proc()
{
    now := time.now()
    duration := time.diff(last_frame_time, now)
    frame_time_f64 := time.duration_seconds(duration)
    frame_time = cast(f32)frame_time_f64
    last_frame_time = now
}