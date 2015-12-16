set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 31.4553, <2> 31.256, <3> 26.0551, <4> 31.3282, <5> 26.4654, <6> 24.5734, <7> 25.5538, <8> 18.9864, <9> 25.2775, <10> 24.8232;
param workload[JOB] := <1> 989.4359, <2> 976.9375, <3> 678.8682, <4> 981.4561, <5> 700.4174, <6> 603.852, <7> 652.9967, <8> 360.4834, <9> 638.952, <10> 616.1913;
param capacity[MACHINE] := <1> 2399.8635, <2> 2399.8635, <3> 2399.8635;

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
