set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 10.6236, <2> 28.7316, <3> 36.4406, <4> 5.7485, <5> 11.1415, <6> 14.3193, <7> 7.2095, <8> 36.9685, <9> 8.9808, <10> 47.4132;
param workload[JOB] := <1> 15.9517, <2> 10.8479, <3> 44.4753, <4> 26.1631, <5> 0.2863, <6> 44.2087, <7> 18.498, <8> 27.8914, <9> 4.4662, <10> 47.6128;
param capacity[MACHINE] := <1> 60.1003, <2> 60.1003, <3> 60.1003;

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
