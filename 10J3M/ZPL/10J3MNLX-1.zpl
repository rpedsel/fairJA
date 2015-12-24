set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 32.1906, <2> 9.5249, <3> 21.22, <4> 16.8843, <5> 23.9457, <6> 19.389, <7> 23.0821, <8> 25.0872, <9> 30.9203, <10> 15.076;
param workload[JOB] := <1> 5.6737, <2> 3.0862, <3> 4.6065, <4> 4.1091, <5> 4.8934, <6> 4.4033, <7> 4.8044, <8> 5.0087, <9> 5.5606, <10> 3.8828;
param capacity[MACHINE] := <1> 15.3429, <2> 15.3429, <3> 15.3429;

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
