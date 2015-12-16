set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 21.6803, <2> 27.1829, <3> 28.5091, <4> 20.2572, <5> 35.6864, <6> 30.0768, <7> 33.4386, <8> 31.2882, <9> 20.9233, <10> 31.9651, <11> 16.5761, <12> 30.1199, <13> 27.1226, <14> 20.0938, <15> 25.9999, <16> 21.6208, <17> 24.5865, <18> 23.1148, <19> 23.4126, <20> 23.8554;
param workload[JOB] := <1> 4.6562, <2> 5.2137, <3> 5.3394, <4> 4.5008, <5> 5.9738, <6> 5.4842, <7> 5.7826, <8> 5.5936, <9> 4.5742, <10> 5.6538, <11> 4.0714, <12> 5.4882, <13> 5.2079, <14> 4.4826, <15> 5.099, <16> 4.6498, <17> 4.9585, <18> 4.8078, <19> 4.8387, <20> 4.8842;
param capacity[MACHINE] := <1> 101.2604, <2> 101.2604, <3> 101.2604, <4> 101.2604, <5> 101.2604, <6> 101.2604;

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
