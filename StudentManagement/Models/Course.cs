namespace StudentManagement.Models
{
    public class Course
    {
        public int Id { get; set; }
        public string Title { get; set; } = string.Empty;
        public int Credits { get; set; }

        public int? InstructorId { get; set; }  //Added in: feat/new-instructor-and-relation-ef
        public Instructor? Instructor { get; set; }  //Added in: feat/new-instructor-and-relation-ef

        public ICollection<Enrollment> Enrollments { get; set; } = new List<Enrollment>();
    }
}
