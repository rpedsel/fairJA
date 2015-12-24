set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 25.665, <2> 30.563, <3> 19.0536, <4> 18.6714, <5> 29.4915, <6> 27.9497, <7> 29.0551, <8> 29.1891, <9> 28.7725, <10> 23.4766, <11> 23.682, <12> 26.737, <13> 28.1435, <14> 21.8207, <15> 24.3827, <16> 25.9042, <17> 19.0152, <18> 19.1073, <19> 26.5497, <20> 29.4669;
param workload[JOB] := <1> 36.2704, <2> 14.3731, <3> 15.6416, <4> 21.6707, <5> 42.5271, <6> 7.9426, <7> 0.0742, <8> 0.3024, <9> 1.1049, <10> 48.4941, <11> 42.0035, <12> 40.2987, <13> 9.0976, <14> 1.1992, <15> 28.8445, <16> 1.9707, <17> 2.8771, <18> 28.7871, <19> 14.9407, <20> 20.8408;
param capacity[MACHINE] := <1> 67.0365, <2> 67.0365, <3> 67.0365, <4> 67.0365, <5> 67.0365, <6> 67.0365, <7> 67.0365;

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
