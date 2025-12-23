#!/usr/bin/env python3

import torch

if torch.cuda.is_available():
    device = torch.device("cuda")
    print("CUDA is working. Moving a tensor to the GPU for a test.")
    x = torch.randn(2, 3, device=device)
    y = torch.randn(2, 3, device=device)
    z = x + y # Perform an operation
    print("Test successful. Result on GPU:", z.device)
else:
    print("CUDA is not available. Check your installation and drivers.")
    exit(1)

