set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 42.0822, <2> 30.2712, <3> 43.635, <4> 16.8385, <5> 6.9551, <6> 33.7285, <7> 2.8479, <8> 10.0406, <9> 27.2215, <10> 17.1144;
param workload[JOB] := <1> 6.4871, <2> 5.5019, <3> 6.6057, <4> 4.1035, <5> 2.6373, <6> 5.8076, <7> 1.6876, <8> 3.1687, <9> 5.2174, <10> 4.137;
param capacity[MACHINE] := <1> 15.1179, <2> 15.1179, <3> 15.1179;

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
