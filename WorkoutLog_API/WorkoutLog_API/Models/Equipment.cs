namespace WorkoutLog_API.Models
{
    public class Equipment
    {
        public int EquipmentId { get; set; }
        public string Name { get; set; } = "";
        public string EquipmentType { get; set; } = "";
        public int UserId { get; set; }
    }
}
