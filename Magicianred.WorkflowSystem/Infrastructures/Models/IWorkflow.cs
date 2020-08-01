using System;
using System.Collections.Generic;
using System.Text;

namespace Magicianred.WorkflowSystem.Infrastructures.Models
{
    /// <summary>
    /// A Workflow
    /// </summary>
    public interface IWorkflow
    {
        /// <summary>
        /// Identity
        /// </summary>
        int Id { get; set; }
        /// <summary>
        /// Ref Workflow type
        /// </summary>
        short TypeId { get; set; }
        /// <summary>
        /// Ref Entity Type
        /// </summary>
        int EntityTypeId { get; set; }

        IEntityType EntityType { get; set; }
    }
}
