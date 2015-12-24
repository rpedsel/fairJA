set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 2.0772, <2> 35.0676, <3> 21.3216, <4> 25.481, <5> 23.2455, <6> 18.2451, <7> 13.4222, <8> 40.6818, <9> 24.2417, <10> 18.382, <11> 24.5081, <12> 40.0323, <13> 24.5693, <14> 33.3551, <15> 6.612, <16> 24.3003, <17> 36.9531, <18> 4.0668, <19> 40.2806, <20> 26.4661;
param workload[JOB] := <1> 1.4412, <2> 5.9218, <3> 4.6175, <4> 5.0479, <5> 4.8214, <6> 4.2714, <7> 3.6636, <8> 6.3782, <9> 4.9236, <10> 4.2874, <11> 4.9506, <12> 6.3271, <13> 4.9567, <14> 5.7754, <15> 2.5714, <16> 4.9295, <17> 6.0789, <18> 2.0166, <19> 6.3467, <20> 5.1445;
param capacity[MACHINE] := <1> 94.4714, <2> 94.4714, <3> 94.4714, <4> 94.4714, <5> 94.4714, <6> 94.4714, <7> 94.4714;

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
