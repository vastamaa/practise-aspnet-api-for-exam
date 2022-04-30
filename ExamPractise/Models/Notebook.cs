#nullable disable

using System.Text.Json.Serialization;

namespace ExamPractise.Models
{
    public partial class Notebook
    {
        public int Id { get; set; }
        public string Brand { get; set; }
        public string Type { get; set; }
        public int Coworkerid { get; set; }

        [JsonIgnore]
        public virtual Coworker Coworker { get; set; }
    }
}
