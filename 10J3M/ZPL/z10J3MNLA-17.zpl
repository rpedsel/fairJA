set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 25.786, <2> 25.8506, <3> 30.2073, <4> 31.6646, <5> 27.2924, <6> 21.0776, <7> 29.9042, <8> 20.7218, <9> 22.5766, <10> 23.1603;
param workload[JOB] := <1> 664.9178, <2> 668.2535, <3> 912.481, <4> 1002.6469, <5> 744.8751, <6> 444.2652, <7> 894.2612, <8> 429.393, <9> 509.7029, <10> 536.3995;
param capacity[MACHINE] := <1> 2269.0654, <2> 2269.0654, <3> 2269.0654;

var x[JM] binary;
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
