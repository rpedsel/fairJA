set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 40.3183, <2> 27.9513, <3> 20.6424, <4> 5.7471, <5> 13.5178, <6> 43.0495, <7> 35.6309, <8> 46.3888, <9> 38.1643, <10> 2.7803;
param workload[JOB] := <1> 6.3497, <2> 5.2869, <3> 4.5434, <4> 2.3973, <5> 3.6767, <6> 6.5612, <7> 5.9692, <8> 6.8109, <9> 6.1777, <10> 1.6674;
param capacity[MACHINE] := <1> 12.3601, <2> 12.3601, <3> 12.3601;

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
