using System.Collections.Generic;
using Microsoft.AspNetCore.Mvc;

namespace TodoApi.Controllers {
    [Route("api/[controller]")]
    [ApiController]
    public class TrainingController : ControllerBase {
        // GET api/training
        [HttpGet]
        public ActionResult<IEnumerable<string>> Get() {
            return new string[] {"loss", "high"};
        }
    }
}