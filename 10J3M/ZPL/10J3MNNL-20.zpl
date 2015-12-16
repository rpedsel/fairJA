set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 30.9509, <2> 30.6091, <3> 23.3907, <4> 29.0308, <5> 20.396, <6> 28.0219, <7> 23.6617, <8> 21.4772, <9> 25.1614, <10> 19.3536;
param workload[JOB] := <1> 30.9509, <2> 30.6091, <3> 23.3907, <4> 29.0308, <5> 20.396, <6> 28.0219, <7> 23.6617, <8> 21.4772, <9> 25.1614, <10> 19.3536;
param capacity[MACHINE] := <1> 252.0533, <2> 252.0533, <3> 252.0533;

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
