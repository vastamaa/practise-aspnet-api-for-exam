using ExamPractise.DTOs;
using ExamPractise.Models;
using ExamPractise.Services.Interfaces;
using Microsoft.EntityFrameworkCore;
using System.Collections.Generic;
using System.Linq;

namespace ExamPractise.Services.Implementations
{
    public class CoworkerService : ICoworkerService
    {
        private readonly AppDbContext _context;

        public CoworkerService(AppDbContext context) => _context = context;

        public IEnumerable<Coworker> GetAllCoworkers() => _context.Coworkers.Include(p => p.Phones).Include(n => n.Notebooks); //Nem csak a dolgozót, de a hozzá tartozó eszközöket is megjelenítjük a lekérdezés során!

        public Coworker GetCoworkerByEmail(string email) => _context.Coworkers.Where(c => c.Email == email).Include(p => p.Phones).Include(n => n.Notebooks).FirstOrDefault(); //Nem csak a dolgozót, de a hozzá tartozó eszközöket is megjelenítjük a lekérdezés során!

        public int AddCoworker(CoworkerDto coworkerDto)
        {
            var check = _context.Coworkers.Where(c => c.Email == coworkerDto.Email).FirstOrDefault();

            if (check is null)
            {
                _context.Coworkers.Add(new Coworker()
                {
                    Name = coworkerDto.Name,
                    Email = coworkerDto.Email
                });

                return _context.SaveChanges();
            }
            return 0;
        }

        public int UpdateCoworker(string email, CoworkerDto coworkerDto)
        {
            var coworker = _context.Coworkers.Where(c => c.Email == email).FirstOrDefault();

            if (coworker is not null)
            {
                coworker.Name = coworkerDto.Name;
                coworker.Email = coworkerDto.Email;

                _context.SaveChanges();
                return 1;
            }
            return 0;
        }

        public int DeleteCoworker(string email)
        {
            var coworker = _context.Coworkers.Where(c => c.Email == email).FirstOrDefault();

            if (coworker is not null)
            {
                _context.Coworkers.Remove(coworker);
                var result = _context.SaveChanges();
                System.Console.WriteLine(result);
                return result;
            }
            return 0;
        }

        public int AddPhoneToCoworker(string email, PhoneDto phoneDto)
        {
            var check = _context.Coworkers.Where(c => c.Email == email).FirstOrDefault();

            if (check is not null)
            {
                check.Phones.Add(new Phone()
                {
                    Brand = phoneDto.Brand,
                    Type = phoneDto.Type,
                    Coworkerid = check.Id
                });

                return _context.SaveChanges();
            }
            return 0;
        }
    }
}
