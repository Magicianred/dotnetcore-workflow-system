﻿using System;
using System.Collections.Generic;
using System.Text;

namespace Magicianred.WorkflowSystem.Infrastructures.Models
{
    public interface IWorkflowStatusType
    {
        int Id { get; set; }
        string Name { get; set; }
        string Description { get; set; }
    }
}
