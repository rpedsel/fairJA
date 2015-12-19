set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 14.8321, <2> 25.5575, <3> 31.2717, <4> 2.9254, <5> 43.9223, <6> 22.5135, <7> 34.9298, <8> 47.2205, <9> 6.3574, <10> 14.0816;
param workload[JOB] := <1> 36.3458, <2> 32.1145, <3> 4.3369, <4> 13.1615, <5> 17.5374, <6> 31.5073, <7> 5.6856, <8> 37.921, <9> 15.8635, <10> 12.6215;
param capacity[MACHINE] := <1> 51.7738, <2> 51.7738, <3> 51.7738;

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
