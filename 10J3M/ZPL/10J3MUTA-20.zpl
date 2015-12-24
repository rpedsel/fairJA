set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 26.0061, <2> 7.8436, <3> 36.7936, <4> 34.3037, <5> 15.7307, <6> 49.596, <7> 26.438, <8> 32.8014, <9> 32.0424, <10> 34.4863;
param workload[JOB] := <1> 676.3172, <2> 61.5221, <3> 1353.769, <4> 1176.7438, <5> 247.4549, <6> 2459.7632, <7> 698.9678, <8> 1075.9318, <9> 1026.7154, <10> 1189.3049;
param capacity[MACHINE] := <1> 2491.6226, <2> 2491.6226, <3> 2491.6226;

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
