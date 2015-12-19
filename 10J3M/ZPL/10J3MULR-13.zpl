set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 11.9348, <2> 3.3044, <3> 6.9458, <4> 16.0967, <5> 21.1115, <6> 20.3013, <7> 17.2793, <8> 18.669, <9> 9.4664, <10> 11.6556;
param workload[JOB] := <1> 17.2743, <2> 37.657, <3> 20.7892, <4> 27.4318, <5> 22.9883, <6> 13.529, <7> 16.4004, <8> 21.9321, <9> 8.5594, <10> 42.3344;
param capacity[MACHINE] := <1> 76.2986, <2> 76.2986, <3> 76.2986;

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
