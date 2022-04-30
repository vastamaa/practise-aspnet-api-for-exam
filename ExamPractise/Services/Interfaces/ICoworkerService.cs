using ExamPractise.DTOs;
using ExamPractise.Models;
using System.Collections.Generic;

namespace ExamPractise.Services.Interfaces
{
    public interface ICoworkerService
    {
        IEnumerable<Coworker> GetAllCoworkers();
        Coworker GetCoworkerByEmail(string email);
        int AddCoworker(CoworkerDto coworkerDto);
        int UpdateCoworker(string email, CoworkerDto coworkerDto);
        int DeleteCoworker(string email);
        int AddPhoneToCoworker(string email, PhoneDto phoneDto);
    }
}
