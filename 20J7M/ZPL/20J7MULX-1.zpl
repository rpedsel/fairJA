set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 21.8326, <2> 43.5979, <3> 43.2414, <4> 8.4116, <5> 17.4042, <6> 26.4375, <7> 17.852, <8> 15.6462, <9> 8.5022, <10> 13.5846, <11> 8.2431, <12> 6.8198, <13> 24.787, <14> 39.4505, <15> 34.1603, <16> 2.1693, <17> 17.419, <18> 20.9316, <19> 29.2884, <20> 28.1278;
param workload[JOB] := <1> 4.6725, <2> 6.6029, <3> 6.5758, <4> 2.9003, <5> 4.1718, <6> 5.1417, <7> 4.2252, <8> 3.9555, <9> 2.9159, <10> 3.6857, <11> 2.8711, <12> 2.6115, <13> 4.9787, <14> 6.281, <15> 5.8447, <16> 1.4729, <17> 4.1736, <18> 4.5751, <19> 5.4119, <20> 5.3036;
param capacity[MACHINE] := <1> 12.6245, <2> 12.6245, <3> 12.6245, <4> 12.6245, <5> 12.6245, <6> 12.6245, <7> 12.6245;

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
