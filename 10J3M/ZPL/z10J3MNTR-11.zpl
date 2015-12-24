set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 32.3694, <2> 26.0745, <3> 18.556, <4> 27.7705, <5> 21.3258, <6> 26.4375, <7> 25.0543, <8> 22.3736, <9> 28.2506, <10> 24.1895;
param workload[JOB] := <1> 25.1196, <2> 34.8506, <3> 34.5637, <4> 16.2569, <5> 45.3445, <6> 31.9764, <7> 35.7709, <8> 10.5165, <9> 26.051, <10> 47.0162;
param capacity[MACHINE] := <1> 76.8666, <2> 76.8666, <3> 76.8666;

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
