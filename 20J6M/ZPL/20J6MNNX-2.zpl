set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 27.9888, <2> 24.5279, <3> 23.9972, <4> 21.9098, <5> 32.543, <6> 26.9004, <7> 28.7886, <8> 37.9006, <9> 20.2692, <10> 26.4845, <11> 17.3717, <12> 23.0009, <13> 19.7435, <14> 24.3354, <15> 22.0126, <16> 28.2865, <17> 24.3228, <18> 24.994, <19> 29.1006, <20> 23.0747;
param workload[JOB] := <1> 5.2904, <2> 4.9526, <3> 4.8987, <4> 4.6808, <5> 5.7046, <6> 5.1866, <7> 5.3655, <8> 6.1563, <9> 4.5021, <10> 5.1463, <11> 4.1679, <12> 4.7959, <13> 4.4434, <14> 4.9331, <15> 4.6918, <16> 5.3185, <17> 4.9318, <18> 4.9994, <19> 5.3945, <20> 4.8036;
param capacity[MACHINE] := <1> 100.3638, <2> 100.3638, <3> 100.3638, <4> 100.3638, <5> 100.3638, <6> 100.3638;

var x[JM];
var z;
maximize minBenefit: z;
subto Z:
   forall <m> in MACHINE do
      sum <j> in JOB : benefit[j] * x[j,m] >= z;
subto K:
   forall <m> in MACHINE do
      sum <j> in JOB : workload[j] * x[j,m] <= capacity[m];
subto X:
   forall <j> in JOB do
      sum <m> in MACHINE : x[j,m] <= 1;
subto A:
   forall <j,m> in JM do
      x[j,m] >= 0;
