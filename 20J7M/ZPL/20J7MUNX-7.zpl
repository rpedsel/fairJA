set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 18.4028, <2> 14.9663, <3> 18.6045, <4> 31.569, <5> 8.4823, <6> 22.0137, <7> 47.3799, <8> 47.9909, <9> 42.7392, <10> 20.5466, <11> 44.6527, <12> 34.8543, <13> 43.4965, <14> 8.2816, <15> 29.5035, <16> 46.2817, <17> 36.3478, <18> 25.4184, <19> 8.5883, <20> 49.6364;
param workload[JOB] := <1> 4.2898, <2> 3.8686, <3> 4.3133, <4> 5.6186, <5> 2.9124, <6> 4.6919, <7> 6.8833, <8> 6.9275, <9> 6.5375, <10> 4.5328, <11> 6.6823, <12> 5.9038, <13> 6.5952, <14> 2.8778, <15> 5.4317, <16> 6.8031, <17> 6.0289, <18> 5.0417, <19> 2.9306, <20> 7.0453;
param capacity[MACHINE] := <1> 105.9161, <2> 105.9161, <3> 105.9161, <4> 105.9161, <5> 105.9161, <6> 105.9161, <7> 105.9161;

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
