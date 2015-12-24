set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 25.3508, <2> 23.6383, <3> 16.5986, <4> 14.8905, <5> 22.7227, <6> 30.1618, <7> 31.813, <8> 26.8831, <9> 19.6689, <10> 32.2128;
param workload[JOB] := <1> 642.6631, <2> 558.7692, <3> 275.5135, <4> 221.727, <5> 516.3211, <6> 909.7342, <7> 1012.067, <8> 722.7011, <9> 386.8656, <10> 1037.6645;
param capacity[MACHINE] := <1> 6284.0263, <2> 6284.0263, <3> 6284.0263;

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
