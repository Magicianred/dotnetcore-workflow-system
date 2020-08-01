using Magicianred.WorkflowSystem.Infrastructures.Models;
using System;
using System.Collections.Generic;
using System.Text;

namespace Magicianred.WorkflowSystem.Models
{
    public partial class WorkflowNextStatus : IWorkflowNextStatus
    {
        public int Id { get; set; }
        public int InitialStatusId { get; set; }
        public int NextStatusId { get; set; }
        public IWorkflowStatus InitialStatus { get; set; }
        public IWorkflowStatus NextStatus { get; set; }
    }
}
