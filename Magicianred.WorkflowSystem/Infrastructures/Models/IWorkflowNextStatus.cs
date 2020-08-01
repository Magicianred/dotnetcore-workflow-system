using System;
using System.Collections.Generic;
using System.Text;

namespace Magicianred.WorkflowSystem.Infrastructures.Models
{
    public interface IWorkflowNextStatus
    {
        int Id { get; set; }
        int InitialStatusId { get; set; }
        int NextStatusId { get; set; }

        IWorkflowStatus InitialStatus { get; set; }
        IWorkflowStatus NextStatus { get; set; }
    }
}
