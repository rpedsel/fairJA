set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 25.4625, <2> 24.3315, <3> 24.7873, <4> 17.4516, <5> 26.0804, <6> 23.7632, <7> 30.9558, <8> 26.3475, <9> 32.9994, <10> 26.1829;
param workload[JOB] := <1> 20.4848, <2> 35.7119, <3> 18.3538, <4> 22.1889, <5> 15.1865, <6> 17.599, <7> 47.5808, <8> 48.2634, <9> 39.6251, <10> 15.626;
param capacity[MACHINE] := <1> 280.6202, <2> 280.6202, <3> 280.6202;

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
