namespace WorkoutLog.API.Data.Models
{
    public class Equipment
    {
        public int Id { get; set; }
        public string Name { get; set; } = "";
        public string EquipmentType { get; set; } = "";

        public Exercise Exercise { get; set; } = new Exercise();
    }
}
