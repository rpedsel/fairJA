set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 27.0326, <2> 28.0666, <3> 22.587, <4> 22.9115, <5> 23.7261, <6> 21.0143, <7> 20.407, <8> 22.3705, <9> 17.3945, <10> 7.893, <11> 20.9625, <12> 25.8992, <13> 34.8546, <14> 34.0615, <15> 24.481, <16> 22.5556, <17> 26.9974, <18> 25.9369, <19> 18.8405, <20> 20.2693;
param workload[JOB] := <1> 5.1993, <2> 5.2978, <3> 4.7526, <4> 4.7866, <5> 4.8709, <6> 4.5841, <7> 4.5174, <8> 4.7297, <9> 4.1707, <10> 2.8094, <11> 4.5785, <12> 5.0891, <13> 5.9038, <14> 5.8362, <15> 4.9478, <16> 4.7493, <17> 5.1959, <18> 5.0928, <19> 4.3406, <20> 4.5021;
param capacity[MACHINE] := <1> 13.7078, <2> 13.7078, <3> 13.7078, <4> 13.7078, <5> 13.7078, <6> 13.7078, <7> 13.7078;

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
