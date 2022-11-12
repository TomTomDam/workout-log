﻿namespace WorkoutLog.API.Models
{
    public class Preference
    {
        public int PreferenceId { get; set; }
        public string WeightUnit { get; set; } = "";
        public string DistanceUnit { get; set; } = "";
        public string BodyMeasurementUnit { get; set; } = "";
        public int DefaultTimerDuration { get; set; }
        public int MaximumTimerDuration { get; set; }
        public bool ShowExerciseSummary { get; set; } = true;
        public bool LogRPE { get; set; }
        public bool ShowExerciseInformation { get; set; } = true;
        public int UserId { get; set; }
    }
}