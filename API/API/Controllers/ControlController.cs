using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System.Diagnostics;

namespace API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ControlController : ControllerBase
    {
        [HttpPost("shutdown")]
        public IActionResult Shutdown()
        {
            // Thực hiện lệnh tắt máy
            Process.Start("shutdown", "/s /t 0");
            return Ok("Shutting down...");
        }

        [HttpPost("restart")]
        public IActionResult Restart()
        {
            // Thực hiện lệnh khởi động lại máy
            Process.Start("shutdown", "/r /t 0");
            return Ok("Restarting...");
        }
        [HttpPost("OpenNotpad")]
        public IActionResult OpenNotpad()
        {
            // Thực hiện lệnh mở ứng dụng Notepad
            Process.Start("notepad");
            return Ok();
        }
    }
}
