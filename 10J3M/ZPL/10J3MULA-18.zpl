set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 16.6705, <2> 40.1318, <3> 27.9778, <4> 3.5485, <5> 38.8008, <6> 32.4796, <7> 9.0519, <8> 24.9698, <9> 5.6232, <10> 18.4838;
param workload[JOB] := <1> 277.9056, <2> 1610.5614, <3> 782.7573, <4> 12.5919, <5> 1505.5021, <6> 1054.9244, <7> 81.9369, <8> 623.4909, <9> 31.6204, <10> 341.6509;
param capacity[MACHINE] := <1> 2107.6473, <2> 2107.6473, <3> 2107.6473;

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
