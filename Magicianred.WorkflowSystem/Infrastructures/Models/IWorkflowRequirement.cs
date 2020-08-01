using System;
using System.Collections.Generic;
using System.Text;

namespace Magicianred.WorkflowSystem.Infrastructures.Models
{
    public interface IWorkflowRequirement
    {
        int Id { get; set; }
        int TypeId { get; set; }
        int WorkflowNextStatusId { get; set; }

        IWorkflowStatus NextStatus { get; set; }
    }
}
