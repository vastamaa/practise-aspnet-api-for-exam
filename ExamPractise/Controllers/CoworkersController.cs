using ExamPractise.DTOs;
using ExamPractise.Services.Interfaces;
using Microsoft.AspNetCore.Mvc;

namespace ExamPractise.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CoworkersController : ControllerBase
    {
        private readonly ICoworkerService _coworkerService;

        public CoworkersController(ICoworkerService coworkerService) => _coworkerService = coworkerService;

        //GET: Minden dolgozó lekérése
        [HttpGet("")]
        public IActionResult GetAllCoworkers() => Ok(_coworkerService.GetAllCoworkers());

        //GET ONE: 1 dolgozó lekérése
        [HttpGet("{email}")]
        public IActionResult GetCoworkerByEmail(string email)
        {
            var coworker = _coworkerService.GetCoworkerByEmail(email);
             
            if (coworker is null) return NotFound();

            return Ok(coworker);
        }

        //POST: Munkavállaló adatbázisba való felrögzítése
        [HttpPost("")]
        public IActionResult AddCoworker(CoworkerDto coworkerDto)
        {
            var coworker = _coworkerService.AddCoworker(coworkerDto);

            if (coworker > 0) return Ok("A munkavállaló felrögzítése sikeres volt!");

            return BadRequest("Hiba! Már létezik a munkavállaló a rendszerben!");
        }

        //POST: Munkavállaló telefonjainak bővítése
        [HttpPost("phone")]
        public IActionResult AddPhoneToCoworker(string email, PhoneDto phoneDto)
        {
            var phone = _coworkerService.AddPhoneToCoworker(email, phoneDto);

            if (phone > 0) return Ok("A telefon felrögzítése sikeresen megtörtént!");

            return BadRequest("Hiba! Nem létezik a munkavállaló a rendszerben!");
        }

        //PUT: Munkavállaló adatának, adatainak frissítése
        [HttpPut("{email}")]
        public IActionResult UpdateCoworker(string email, CoworkerDto coworkerDto)
        {
            var coworker = _coworkerService.UpdateCoworker(email, coworkerDto);

            if (coworker > 0) return Ok("Az adat frissítés sikeres volt!");

            return BadRequest("Hiba! Nincs ilyen munkavállaló a rendszerben!");
        }

        //DELETE: Munkavállaló törlése
        [HttpDelete("{email}")]
        public IActionResult DeleteCoworker(string email)
        {
            var coworker = _coworkerService.DeleteCoworker(email);

            if (coworker > 0) return Ok("A munkavállaló törlése megtörtént!");

            return BadRequest("Hiba! Nincs ilyen munkavállaló a rendszerben!");
        }
    }
}
