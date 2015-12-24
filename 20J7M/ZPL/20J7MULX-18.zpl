set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 33.8449, <2> 17.9001, <3> 7.2363, <4> 30.6668, <5> 41.481, <6> 7.4675, <7> 42.232, <8> 26.5761, <9> 26.285, <10> 45.1345, <11> 22.8396, <12> 17.1256, <13> 44.4038, <14> 35.856, <15> 43.0656, <16> 21.2738, <17> 44.4853, <18> 24.833, <19> 22.4517, <20> 3.0268;
param workload[JOB] := <1> 5.8176, <2> 4.2309, <3> 2.69, <4> 5.5378, <5> 6.4406, <6> 2.7327, <7> 6.4986, <8> 5.1552, <9> 5.1269, <10> 6.7182, <11> 4.7791, <12> 4.1383, <13> 6.6636, <14> 5.988, <15> 6.5624, <16> 4.6124, <17> 6.6697, <18> 4.9833, <19> 4.7383, <20> 1.7398;
param capacity[MACHINE] := <1> 14.5462, <2> 14.5462, <3> 14.5462, <4> 14.5462, <5> 14.5462, <6> 14.5462, <7> 14.5462;

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
