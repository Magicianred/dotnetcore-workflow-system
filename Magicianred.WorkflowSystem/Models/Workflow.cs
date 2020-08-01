using Magicianred.WorkflowSystem.Infrastructures.Models;
using System;
using System.Collections.Generic;
using System.Text;

namespace Magicianred.WorkflowSystem.Models
{
    public partial class Workflow : IWorkflow
    {
        public int Id { get; set; }
        public short TypeId { get; set; }
        public int EntityTypeId { get; set; }

        public IEntityType EntityType { get; set; }
    }
}
