set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 28.5297, <2> 17.9792, <3> 30.2411, <4> 28.5358, <5> 13.9513, <6> 27.5763, <7> 29.0174, <8> 28.9487, <9> 22.5104, <10> 22.0602, <11> 28.5771, <12> 27.5793, <13> 19.047, <14> 27.3225, <15> 25.6117, <16> 23.5951, <17> 28.9288, <18> 21.8146, <19> 21.8365, <20> 9.9753;
param workload[JOB] := <1> 5.3413, <2> 4.2402, <3> 5.4992, <4> 5.3419, <5> 3.7351, <6> 5.2513, <7> 5.3868, <8> 5.3804, <9> 4.7445, <10> 4.6968, <11> 5.3458, <12> 5.2516, <13> 4.3643, <14> 5.2271, <15> 5.0608, <16> 4.8575, <17> 5.3785, <18> 4.6706, <19> 4.673, <20> 3.1584;
param capacity[MACHINE] := <1> 97.6051, <2> 97.6051, <3> 97.6051, <4> 97.6051, <5> 97.6051, <6> 97.6051, <7> 97.6051;

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
