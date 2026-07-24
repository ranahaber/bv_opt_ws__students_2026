NAME          Cheese Manufacturing MILP
ROWS
 N  OBJ
 L  C_0
 L  C_1
 L  C_2
 L  C_3
 L  C_4
 L  C_5
 E  C_6
 E  C_7
 L  C_8
 L  C_9
 L  C_10
 L  C_11
 L  C_12
 L  C_13
 L  C_14
 L  C_15
 L  C_16
 L  C_17
 L  C_18
 L  C_19
 L  C_20
 L  C_21
COLUMNS
    x_VH1_P1 C_6 1
    x_VH1_P1 C_8 1
    x_VH1_P1 C_20 -0.20000000000000001
    x_VH1_P1 OBJ 5
    x_VH1_P2 C_7 1
    x_VH1_P2 C_9 1
    x_VH1_P2 C_21 -0.20000000000000001
    x_VH1_P2 OBJ 4
    x_VH2_P1 C_6 1
    x_VH2_P1 C_10 1
    x_VH2_P1 C_20 -0.20000000000000001
    x_VH2_P1 OBJ 2
    x_VH2_P2 C_7 1
    x_VH2_P2 C_11 1
    x_VH2_P2 C_21 -0.20000000000000001
    x_VH2_P2 OBJ 2
    x_VH3_P1 C_6 1
    x_VH3_P1 C_12 1
    x_VH3_P1 C_20 -0.20000000000000001
    x_VH3_P1 OBJ 2
    x_VH3_P2 C_7 1
    x_VH3_P2 C_13 1
    x_VH3_P2 C_21 -0.20000000000000001
    x_VH3_P2 OBJ 4
    x_VH4_P1 C_6 1
    x_VH4_P1 C_14 1
    x_VH4_P1 C_20 -0.20000000000000001
    x_VH4_P1 OBJ 3
    x_VH4_P2 C_7 1
    x_VH4_P2 C_15 1
    x_VH4_P2 C_21 -0.20000000000000001
    x_VH4_P2 OBJ 2
    x_VL1_P1 C_6 1
    x_VL1_P1 C_16 1
    x_VL1_P1 C_20 0.80000000000000004
    x_VL1_P1 OBJ 1
    x_VL1_P2 C_7 1
    x_VL1_P2 C_17 1
    x_VL1_P2 C_21 0.80000000000000004
    x_VL1_P2 OBJ 1
    x_VL2_P1 C_6 1
    x_VL2_P1 C_18 1
    x_VL2_P1 C_20 0.80000000000000004
    x_VL2_P1 OBJ 1
    x_VL2_P2 C_7 1
    x_VL2_P2 C_19 1
    x_VL2_P2 C_21 0.80000000000000004
    x_VL2_P2 OBJ 2
    MARK0001  'MARKER'                 'INTORG'
    y_VH1_P1 C_0 1
    y_VH1_P1 C_8 -60
    y_VH1_P2 C_0 1
    y_VH1_P2 C_9 -60
    y_VH2_P1 C_1 1
    y_VH2_P1 C_10 -20
    y_VH2_P2 C_1 1
    y_VH2_P2 C_11 -20
    y_VH3_P1 C_2 1
    y_VH3_P1 C_12 -30
    y_VH3_P2 C_2 1
    y_VH3_P2 C_13 -30
    y_VH4_P1 C_3 1
    y_VH4_P1 C_14 -40
    y_VH4_P2 C_3 1
    y_VH4_P2 C_15 -40
    y_VL1_P1 C_4 1
    y_VL1_P1 C_16 -40
    y_VL1_P2 C_4 1
    y_VL1_P2 C_17 -40
    y_VL2_P1 C_5 1
    y_VL2_P1 C_18 -20
    y_VL2_P2 C_5 1
    y_VL2_P2 C_19 -20
    MARK0001  'MARKER'                 'INTEND'
RHS
    RHS1      C_0 1
    RHS1      C_1 1
    RHS1      C_2 1
    RHS1      C_3 1
    RHS1      C_4 1
    RHS1      C_5 1
    RHS1      C_6 100
    RHS1      C_7 60
BOUNDS
 UI BOUND1    y_VH1_P1 1
 UI BOUND1    y_VH1_P2 1
 UI BOUND1    y_VH2_P1 1
 UI BOUND1    y_VH2_P2 1
 UI BOUND1    y_VH3_P1 1
 UI BOUND1    y_VH3_P2 1
 UI BOUND1    y_VH4_P1 1
 UI BOUND1    y_VH4_P2 1
 UI BOUND1    y_VL1_P1 1
 UI BOUND1    y_VL1_P2 1
 UI BOUND1    y_VL2_P1 1
 UI BOUND1    y_VL2_P2 1
ENDATA
