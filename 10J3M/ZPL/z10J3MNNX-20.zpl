set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 20.3619, <2> 20.4045, <3> 18.8044, <4> 26.1709, <5> 16.987, <6> 19.5546, <7> 27.4702, <8> 26.435, <9> 17.1821, <10> 32.3643;
param workload[JOB] := <1> 4.5124, <2> 4.5171, <3> 4.3364, <4> 5.1158, <5> 4.1215, <6> 4.4221, <7> 5.2412, <8> 5.1415, <9> 4.1451, <10> 5.689;
param capacity[MACHINE] := <1> 47.2421, <2> 47.2421, <3> 47.2421;

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
