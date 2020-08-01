using Magicianred.WorkflowSystem.Infrastructures.Models;
using System;
using System.Collections.Generic;
using System.Text;

namespace Magicianred.WorkflowSystem.Models
{
    public partial class WorkflowAction : IWorkflowAction
    {
        public int Id { get; set; }
        public int TypeId { get; set; }
        public int WorkflowNextStatusId { get; set; }
        public IWorkflowNextStatus NextStatus { get; set; }
    }
}
