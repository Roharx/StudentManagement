namespace StudentManagement.Models
{
    public class Enrollment
    {
        public int Id { get; set; }
        public int StudentId { get; set; }
        public int CourseId { get; set; }
        
        //Replaces Grade
        public string? FinalGrade { get; set; } //Added in: feat/modify-enrollment-grade-to-finalgrade 

        public string? Grade { get; set; }  //Will be dropped after migration

        public Student Student { get; set; } = null!;
        public Course Course { get; set; } = null!;
    }
}
