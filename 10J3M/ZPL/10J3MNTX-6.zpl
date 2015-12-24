set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 28.6363, <2> 34.4986, <3> 22.1233, <4> 23.3032, <5> 20.706, <6> 25.1023, <7> 30.9651, <8> 24.4775, <9> 27.4859, <10> 21.0004;
param workload[JOB] := <1> 5.3513, <2> 5.8736, <3> 4.7035, <4> 4.8273, <5> 4.5504, <6> 5.0102, <7> 5.5646, <8> 4.9475, <9> 5.2427, <10> 4.5826;
param capacity[MACHINE] := <1> 12.6634, <2> 12.6634, <3> 12.6634;

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
