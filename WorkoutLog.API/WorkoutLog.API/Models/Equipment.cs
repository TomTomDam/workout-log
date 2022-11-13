namespace WorkoutLog.API.Models
{
    public class Equipment
    {
        public int EquipmentId { get; set; }
        public string Name { get; set; } = "";
        public string EquipmentType { get; set; } = "";
        public int UserId { get; set; }
        public User User { get; set; } = new User();
    }
}
