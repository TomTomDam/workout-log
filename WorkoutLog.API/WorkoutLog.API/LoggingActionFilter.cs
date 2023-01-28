using Microsoft.AspNetCore.Mvc.Filters;
using Serilog;

namespace WorkoutLog.API
{
    public class LoggingActionFilter : IActionFilter
    {
        private readonly IDiagnosticContext _diagnosticContext;

        public LoggingActionFilter(IDiagnosticContext diagnosticContext)
        {
            _diagnosticContext = diagnosticContext;
        }

        public void OnActionExecuting(ActionExecutingContext context)
        {

        }

        public void OnActionExecuted(ActionExecutedContext context) { }
    }
}
