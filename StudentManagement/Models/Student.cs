namespace StudentManagement.Models
{
    public class Student
    {
        public int Id { get; set; }
        public string FirstName { get; set; } = string.Empty;
        public string? MiddleName { get; set; } //Added in: feat/add-student-middlename-ef
        public string LastName { get; set; } = string.Empty;
        public string Email { get; set; } = string.Empty;
        public DateTime EnrollmentDate { get; set; }
        public DateTime? DateOfBirth { get; set; } //Added in: feat/add-student-date-of-birth-ef
        public ICollection<Enrollment> Enrollments { get; set; } = new List<Enrollment>();
    }
}
