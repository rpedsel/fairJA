set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 46.6496, <2> 9.6189, <3> 19.3482, <4> 20.1767, <5> 17.1831, <6> 10.4604, <7> 16.8995, <8> 5.7773, <9> 28.3203, <10> 2.5087;
param workload[JOB] := <1> 46.6496, <2> 9.6189, <3> 19.3482, <4> 20.1767, <5> 17.1831, <6> 10.4604, <7> 16.8995, <8> 5.7773, <9> 28.3203, <10> 2.5087;
param capacity[MACHINE] := <1> 58.9809, <2> 58.9809, <3> 58.9809;

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
