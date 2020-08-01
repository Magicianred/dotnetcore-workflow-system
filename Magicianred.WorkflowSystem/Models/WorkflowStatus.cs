using Magicianred.WorkflowSystem.Infrastructures.Models;
using System;
using System.Collections.Generic;
using System.Text;

namespace Magicianred.WorkflowSystem.Models
{
    public partial class WorkflowStatus : IWorkflowStatus
    {
        public int Id { get; set; }
        public int WorkflowId { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public short TypeId { get; set; }
        public IWorkflowStatusType Type { get; set; }
    }
}
