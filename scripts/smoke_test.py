#!/usr/bin/env python3
"""Minimal cuOpt smoke test for the workshop environment."""

from __future__ import annotations

from pathlib import Path
import sys


def check_file(path: Path) -> None:
    if not path.exists():
        raise FileNotFoundError(f"Missing required workshop file: {path}")


def main() -> int:
    print("Python:", sys.version.split()[0])

    import cuopt
    import cudf
    import matplotlib
    import networkx
    import numpy
    import pandas

    print("cuOpt:", getattr(cuopt, "__version__", "unknown"))
    print("cuDF:", getattr(cudf, "__version__", "unknown"))
    print("NumPy:", numpy.__version__)
    print("Pandas:", pandas.__version__)
    print("Matplotlib:", matplotlib.__version__)
    print("NetworkX:", networkx.__version__)

    from cuopt.linear_programming.problem import CONTINUOUS, MAXIMIZE, Problem

    problem = Problem("WorkshopSmokeTest")
    x = problem.addVariable(lb=0, vtype=CONTINUOUS, name="x")
    y = problem.addVariable(lb=0, vtype=CONTINUOUS, name="y")

    problem.addConstraint(2 * x + y <= 8, name="resource_a")
    problem.addConstraint(x + 2 * y <= 8, name="resource_b")
    problem.setObjective(3 * x + 2 * y, sense=MAXIMIZE)
    problem.solve()

    status = problem.Status.name
    print("Smoke status:", status)
    print("Smoke objective:", problem.ObjValue)
    print("x:", x.Value)
    print("y:", y.Value)

    if status not in {"Optimal", "PrimalFeasible", "FeasibleFound"}:
        raise RuntimeError(f"Unexpected cuOpt solve status: {status}")

    workshop_dir = Path(__file__).resolve().parents[1]
    data_dir = workshop_dir / "data"

    for name in (
        "00-Setup-Smoke-Test.ipynb",
        "01-01-VRP-Solver.ipynb",
        "01-02-MIP-Solver.ipynb",
        "01-03-LP-Solver.ipynb",
        "01-04-QP-Solver.ipynb",
    ):
        check_file(workshop_dir / name)

    for name in (
        "Cheese.mps",
        "MIP_model.mps",
        "cheese_lp.mps",
    ):
        check_file(data_dir / name)

    print("Workshop smoke test passed.")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
